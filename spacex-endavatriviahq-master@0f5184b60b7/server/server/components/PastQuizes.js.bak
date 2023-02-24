import React from 'react'
import { useSelector } from 'react-redux'
import { getAllPastQuizzes } from '../slices/pastQuizzes'
import ListQuizComponent from './ListQuizComponent'

const PastQuizes = () => {
  const pastQuizzes = useSelector(getAllPastQuizzes)

  return (
    <div className="max-w-7xl mx-auto mt-10 pt-7">
      <h2 className="font-sans font-bold text-[#233237] text-2xl md:text-4xl">
        Past quizzes{' '}
        <span className="text-base md:text-xl text-[#989898]">
          ({pastQuizzes.length}
          quizzes )
        </span>
      </h2>
      <div className="w-full bg-[#F8F8F8] p-8 mt-8 min-h-[387px] space-y-6 mb-5">
        {pastQuizzes.length === 0 ? (
          <p className="text-lg text-[#989898] font-sans font-bold">
            You don't have any past quizzes right now.
          </p>
        ) : (
          pastQuizzes?.map((item) => (
            <ListQuizComponent key={item.id} quiz={item} />
          ))
        )}
      </div>
    </div>
  )
}

export default PastQuizes
