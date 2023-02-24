import { HubConnectionBuilder } from '@microsoft/signalr'
import React, { useEffect, useState } from 'react'
import { CountdownCircleTimer } from 'react-countdown-circle-timer'

const DipslayQuestions = () => {
  const [connection, setConnection] = useState(null)
  const [question, setQuestion] = useState(null)
  const [answer, setAnswer] = useState(null)
  const [correct, setCorrect] = useState(null)
  const [score, setScore] = useState('')
  const [displayScore, setDisplayScore] = useState('')

  const [disable, setDisable] = useState(false)
  const [duration, setDuration] = useState(null)
  const [showCorrectAnswer, setShowCorrectAnswer] = useState(false)
  const user = sessionStorage.getItem('user')

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
          connection.on('GetQuestion', (question) => {
            setQuestion(question)
          })
          connection.on('UpdateScore', (score) => {
            setScore(score)
          })
        })
        .catch((e) => console.log('Connection failed: ', e))
    }
  }, [connection])

  useEffect(() => {
    if (showCorrectAnswer) setDisplayScore(score)
  }, [score, showCorrectAnswer])

  const handleClick = async (value) => {
    setAnswer(value)
    setDisable(true)
    setCorrect(value.isCorrect)
    await fetch(
      `https://localhost:7104/play?answerId=${value.id}&username=${JSON.parse(
        user
      )}`,
      {
        headers: {
          'Content-Type': 'application/json',
          accept: 'text/plain',
        },
        method: 'POST',
        mode: 'cors',
      }
    )
    await connection.invoke('UpdateScore', JSON.parse(user))
  }
  useEffect(() => {
    setShowCorrectAnswer(false)
  }, [question])

  useEffect(() => {
    setDuration(question)
    setDisable(false)
  }, [question])

  return (
    <>
      <h1 className="text-white absolute top-5 right-5 font-bold text-lg">
        {`${JSON.parse(user)} | score: ${displayScore}`}
      </h1>
      {question ? (
        <div className="flex flex-col w-full items-center justify-center ">
          {duration?.duration && (
            <CountdownCircleTimer
              isPlaying
              duration={question.duration}
              strokeWidth={6}
              size={100}
              colors={['#004777', '#F7B801', '#A30000', '#A30000']}
              colorsTime={[7, 5, 2, 0]}
              onComplete={() => {
                return {
                  shouldRepeat: duration && true,
                  delay: 1.5,
                  newInitialRemainingTime: duration.duration,
                }
              }}
            >
              {({ remainingTime }) => {
                if (remainingTime === 0) {
                  if (question?.duration) {
                    setShowCorrectAnswer(true)
                  }
                  setDuration(null)
                }
                return (
                  <div className="flex items-center justify-center">
                    <div className="text-white text-2xl font-bold">
                      {remainingTime}
                    </div>
                  </div>
                )
              }}
            </CountdownCircleTimer>
          )}
          <h2 className="pt-12 text-white text-center text-3xl text-bold">
            {question?.text}
          </h2>
          <div className="pt-24 flex flex-col h-full space-y-6">
            {question?.answers?.map((item, i) => (
              <button
                onClick={() => handleClick(item)}
                disabled={disable}
                key={i}
                value={item.isCorrect}
                className={`py-5 px-48 border rounded-xl text-white text-lg font-bold ${
                  !showCorrectAnswer &&
                  answer?.text === item?.text &&
                  'bg-gray-200'
                } ${
                  answer?.text === item?.text
                    ? showCorrectAnswer &&
                      (correct ? 'bg-green-500 bg-none' : 'bg-red-400 bg-none')
                    : 'bg-transparent'
                }`}
              >
                {item?.text}
              </button>
            ))}
          </div>
        </div>
      ) : (
        <div className="flex flex-col items-center justify-center">
          <p className="text-white text-4xl font-normal">
            waiting for administrator to send questions
          </p>
        </div>
      )}
    </>
  )
}

export default DipslayQuestions
