import { useRouter } from 'next/router'
import React from 'react'
import { useSelector } from 'react-redux'
import { getAllCurrentQuizzes } from '../slices/currentQuizzes'
import AddQuizComponent from './AddQuizComponent'
import QuizzComponent from './QuizzComponent'

const MyQuizzes = () => {
  const router = useRouter()
  const currentQuizzes = useSelector(getAllCurrentQuizzes)

  return (
    <main className="flex flex-col justify-between max-w-7xl mx-auto items-center pt-10">
      <div className="flex flex-col md:flex-row space-y-5 md:space-y-0 w-[90%] md:w-full mx-auto items-center justify-between">
        <h2 className="font-sans font-bold text-[#233237] text-2xl md:text-4xl">
          My quizzes{' '}
          <span className="text-base md:text-xl text-[#989898]">
            ({currentQuizzes?.length || '0'} quizzes)
          </span>
        </h2>
        <button
          onClick={() => router.push('/admin/create-quiz')}
          type="button"
          className="button"
        >
          Create Quiz
        </button>
      </div>
      <div className="w-full flex space-x-8 overflow-x-scroll overflow-y-hidden bg-[#F8F8F8] py-8 pl-8 mt-8 h-96">
        {currentQuizzes.length <= 0 ? (
          <AddQuizComponent />
        ) : (
          currentQuizzes.map((item) => (
            <QuizzComponent key={item.id} quiz={item} />
          ))
        )}
      </div>
    </main>
  )
}

export default MyQuizzes
