import React, { useEffect, useState } from 'react'
import dayjs from 'dayjs'
import duration from 'dayjs/plugin/duration'
import PlayTime from './PlayTime'
import { HubConnectionBuilder } from '@microsoft/signalr'
import { useRouter } from 'next/router'
import DipslayQuestions from './DipslayQuestions'
import LeaderboardComponent from './LeaderboardComponent'
import { useDispatch, useSelector } from 'react-redux'
import { handleUser, userState } from '../slices/user'
import { playQuizState } from '../slices/playIdSlice'
import { addPlayersLeaderboard } from '../slices/playersLeaderboard'

dayjs.extend(duration)

const Login = () => {
  const router = useRouter()
  const request = useSelector(playQuizState)
  const hasUser = useSelector(userState)
  const dispatch = useDispatch()
  const [userInput, setUserInput] = useState('')
  const [connection, setConnection] = useState(null)
  const [quizStatus, setQuizStatus] = useState(request?.status)
  const [leaderboard, setLeaderboard] = useState()

  useEffect(() => {
    dispatch(addPlayersLeaderboard(request?.status))
    setQuizStatus(request?.status)
  }, [request, connection])

  useEffect(() => {
    const newConnection = new HubConnectionBuilder()
      .withUrl('https://localhost:7104/quizHubs')
      .withAutomaticReconnect()
      .build()

    setConnection(newConnection)
  }, [])

  useEffect(() => {
    if (connection) {
      connection
        .start()
        .then(() => {
          connection.on('JoinMessage', (user) => {
            sessionStorage.setItem('user', JSON.stringify(user))
            dispatch(handleUser(user))
          })
          connection.on('ResetQuiz', (quiz) => {
            setQuizStatus(quiz.status)
          })
          connection.on('OpenQuiz', (quiz) => {
            setQuizStatus(quiz.status)
          })
          connection.on('StartQuiz', (quiz) => {
            setQuizStatus(quiz.status)
          })
          connection.on('FinishQuiz', (quiz) => {
            setQuizStatus(quiz.status)
          })
          connection.on('GetLeaderboard', (liderboard) => {
            setLeaderboard(liderboard)
          })
        })
        .catch((e) => console.log('Connection failed: ', e))
    }
  }, [connection])

  useEffect(() => {
    const getUserFromStorage = JSON.parse(sessionStorage.getItem('user'))
    if (getUserFromStorage) {
      dispatch(handleUser(getUserFromStorage))
    }
  }, [])

  const handleInputUser = (value) => {
    setUserInput(value.target.value)
  }

  const sendMessage = async () => {
    if ((userInput.length > 0 && userInput) || hasUser) {
      try {
        await connection.invoke(
          'JoinQuiz',
          userInput || hasUser,
          router.query.id
        )
        await connection.invoke('UpdateScore', userInput || hasUser)
      } catch (err) {
        console.error(err)
      }
    }
  }

  return (
    <main className="">
      <div className="flex flex-col items-center justify-center">
        {quizStatus === 1 ? (
          <div className="pt-24">
            <h2 className="font-bold text-4xl text-center text-white">
              {request.name}
            </h2>
            <h2 className="text-xl font-normal text-center text-white mt-8">
              {dayjs(request.startingDateTime).format('DD/MM/YYYY')} |{' '}
              {dayjs(request.startingDateTime).format('h:MM A')}{' '}
              {hasUser && '| ' + hasUser}
            </h2>
            <div className="mt-52">
              {!hasUser ? (
                <>
                  <input
                    className="input__primary w-96"
                    type="text"
                    placeholder="username"
                    onChange={handleInputUser}
                    value={userInput}
                  />
                  <button
                    onClick={sendMessage}
                    className="button border-none w-96 mt-10"
                  >
                    JOIN QUIZ
                  </button>
                </>
              ) : (
                <PlayTime quizStatus={quizStatus} />
              )}
            </div>
          </div>
        ) : (
          quizStatus === 2 && (
            <div className="">
              {!hasUser ? (
                <h1 className="font-bold text-4xl text-center text-white">
                  Quiz started
                </h1>
              ) : (
                <DipslayQuestions />
              )}
            </div>
          )
        )}
        {quizStatus < 1 && (
          <h2 className="text-4xl font-bold text-center text-white mt-8">
            Trivia game ( {request.name} ) is not open
          </h2>
        )}

        {quizStatus === 3 && (
          <div>
            <LeaderboardComponent leaderboard={leaderboard} />
          </div>
        )}
      </div>
    </main>
  )
}

export default Login
