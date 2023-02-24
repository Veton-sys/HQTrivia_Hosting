import React, { useEffect, useState } from 'react'
import Image from 'next/image'
import Question from '../public/images/question.svg'
import QuestionPlay from '../public/images/questionGreen.svg'
import CheckIcon from '../public/images/checkIcon.svg'
import { useRouter } from 'next/router'
import { useSelector } from 'react-redux'
import { getQuizById } from '../slices/quizById'

const QuestionPlayComponent = ({ questionData, id }) => {
  const router = useRouter()
  const quizId = useSelector(getQuizById)
  const handlePlayButton = async () => {
    await fetch(
      `https://localhost:7104/admin/Quizzes/SendQuestion/${router.query.id}/${questionData.id}`,
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
      {quizId.questions.length - 1 !== id && (
        <div className="w-full bg-white mx-auto">
          <div className="flex items-center justify-between py-6 px-8">
            <div className="flex items-center space-x-4">
              <Image
                src={questionData.isSent ? Question : QuestionPlay}
                width={40}
                height={40}
                alt="Question"
              />
              <h2 className="text-[#233237] text-base font-bold">
                {questionData.text}
              </h2>
            </div>
            {questionData.isSent ? (
              <div className="flex items-center space-x-2">
                <Image src={CheckIcon} width={14} height={10} alt="check" />
                <p className="text-[#8CB55A] font-bold text-xs">Finished</p>
              </div>
            ) : (
              <button
                disabled={quizId.status !== 2}
                onClick={handlePlayButton}
                className={`rounded-md text-white uppercase py-1 px-8 text-base font-bold 
                ${quizId.status === 2 ? 'bg-[#8CB55A]' : 'bg-[#989898]'}
                `}
              >
                Play
              </button>
            )}
          </div>
        </div>
      )}
    </>
  )
}

export default QuestionPlayComponent
