import { useRouter } from 'next/router'
import React, { useState } from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { addAdminLiderboard } from '../slices/adminLeaderboard'
import { getQuizById } from '../slices/quizById'
import AdminLiderboard from './AdminLiderboard'
import ListQuizComponent from './ListQuizComponent'
import QuestionComponent from './QuestionComponent'
import QuestionPlayComponent from './QuestionPlayComponent'

const AdminQuestionComponent = () => {
  const router = useRouter()
  const dispatch = useDispatch()
  const [results, setResults] = useState(null)
  const quizId = useSelector(getQuizById)

  const handleFinishDeleteQuiz = async () => {
    if (quizId.status >= 1) {
      await (
        await fetch(
          ` https://localhost:7104/admin/Quizzes/FinishQuiz/${parseInt(
            router.query.id
          )}`,
          {
            rejectUnauthorized: false,
            method: 'POST',
          }
        )
      )
        .json()
        .then((data) => {
          dispatch(addAdminLiderboard(data))
          setResults(data)
        })
    } else {
      await fetch(
        `https://localhost:7104/admin/Quizzes/${parseInt(router.query.id)}`,
        {
          rejectUnauthorized: false,
          method: 'DELETE',
        }
      )
      router.push('/admin')
    }
  }

  const handleStartQuiz = async () => {
    await fetch(
      `https://localhost:7104/admin/Quizzes/StartQuiz/${router.query.id}`,
      {
        headers: {
          'Content-Type': 'application/json',
          accept: 'text/plain',
        },
        method: 'POST',
        mode: 'cors',
      }
    )
    location.reload()
  }

  return (
    <>
      <div className="max-w-7xl sticky top-0 mx-auto space-y-7 mt-10 pt-7">
        <div className="sticky top-0 z-50 w-full bg-white">
          <div className="flex items-center justify-between">
            <h2 className="font-sans font-bold text-[#233237] text-2xl md:text-4xl overflow-hidden truncate">
              {quizId?.name}
            </h2>
            <div className="flex items-center space-x-5">
              <button
                disabled={quizId.status >= 2}
                onClick={handleStartQuiz}
                className={`newBtn min-w-[200px] ${
                  quizId.status >= 2
                    ? 'bg-[#989898]'
                    : 'bg-[#DE411B] transition duration-150 active:scale-105 ease-in-out'
                } `}
              >
                {quizId.status >= 2 ? 'Started' : 'start quiz'}
              </button>
              <button
                disabled={results}
                onClick={handleFinishDeleteQuiz}
                className={`uppercase min-w-[200px] py-3 border  rounded-md font-bold text-base transition duration-150 active:scale-105 ease-in-out ${
                  results
                    ? 'border-[$989898] text-[#989898]'
                    : 'border-[#233237] hover:bg-[#233237] hover:text-white text-[#233237]'
                }`}
              >
                {quizId === 3 || results
                  ? 'Finished'
                  : quizId.status >= 1
                  ? 'Finish Quiz'
                  : 'Delete Quiz'}
              </button>
            </div>
          </div>
          <div className="w-full bg-[#F8F8F8] mt-10 min-h-full mb-5">
            <ListQuizComponent quiz={quizId} />
          </div>
          <div className="mt-10 flex items-center pb-2 justify-between">
            <div className="flex items-end space-x-2">
              <h2 className="font-sans font-bold text-[#233237] text-2xl md:text-4xl">
                {quizId?.status < 3 ? 'Questions' : 'Results'}
              </h2>
              {quizId?.status < 3 && (
                <p className="text-[#989898] text-xl font-bold">
                  ({quizId?.questions?.length - 1} questions)
                </p>
              )}
            </div>
          </div>
        </div>
        {quizId.status === 0 &&
          !results &&
          quizId?.questions?.map((item, i) => (
            <QuestionComponent id={i} key={item.id} questionData={item} />
          ))}
        <div className="space-y-5 bg-[#f8f8f8] p-4">
          {quizId.status >= 1 &&
            quizId.status <= 2 &&
            !results &&
            quizId.questions?.map((item, i) => (
              <QuestionPlayComponent id={i} key={item.id} questionData={item} />
            ))}
        </div>
        {(quizId.status === 3 || results) && (
          <div className="bg-[#f8f8f8] p-4">
            <AdminLiderboard results={results} />
          </div>
        )}
      </div>
    </>
  )
}

export default AdminQuestionComponent
