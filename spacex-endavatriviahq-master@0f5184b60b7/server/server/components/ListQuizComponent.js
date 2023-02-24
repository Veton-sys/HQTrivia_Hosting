import React, { useState } from 'react'
import Image from 'next/image'
import ImageLogo from '../public/images/imglogo.svg'
import ThreeDots from '../public/images/threeDots.svg'
import Modal from './Modal'
import { useRouter } from 'next/router'
import dayjs from 'dayjs'
import { getQuizById } from '../slices/quizById'
import { useSelector } from 'react-redux'

const ListQuizComponent = ({ quiz }) => {
  console.log(quiz)
  const quizId = useSelector(getQuizById)
  const router = useRouter()

  const handleStartAgain = async () => {
    if (quizId.status > 1) return
    await fetch(`https://localhost:7104/admin/Quizzes/ResetQuiz/${quiz.id}`, {
      headers: {
        'Content-Type': 'application/json',
        accept: 'text/plain',
      },
      method: 'POST',
      mode: 'cors',
    })
    window.location.reload()
  }

  const handleStartQuestion = async () => {
    await fetch(`https://localhost:7104/admin/Quizzes/OpenQuiz/${quiz.id}`, {
      headers: {
        'Content-Type': 'application/json',
        accept: 'text/plain',
      },
      method: 'POST',
      mode: 'cors',
    })
    window.location.reload()
  }

  const handleCopyLink = () => {
    navigator.clipboard.writeText(
      `http://localhost:3000/play/${router.query.id}`
    )
    alert('You have sucessfully copy the url for play time')
  }

  return (
    <div
      className={`flex relative items-center justify-between h-28 px-4 bg-white hover:shadow-md cursor-pointer ${
        quizId.status >= 1 && quizId.status < 3 && 'bg-[#EDF9F6]'
      }
       `}
    >
      <div className="flex space-x-5">
        <Image
          src={quiz.thumbNailURL || ImageLogo}
          width={125}
          height={76}
          alt="Quiz thubnail"
        />
        <div className="flex flex-col space-y-2">
          <h2 className="text-lg font-bold text-[#233237] font-sans">
            {quiz?.name}
          </h2>
          <div className="flex space-x-2">
            <p className="paragraph">
              {dayjs(quiz?.startingDateTime).format('DD/MM/YYYY')}
            </p>
            <p className="paragraph">
              {dayjs(quiz?.startingDateTime).format('HH:mm')}
            </p>
          </div>
          <p className="py-[2px] bg-[#989898] items-center w-28 mt-2 rounded-md text-xs text-white font-bold text-center">
            {quiz?.questions?.length - 1} questions
          </p>
        </div>
      </div>
      <div className="space-y-4 mr-4">
        <h2 className="text-[#233237] text-base font-bold text-center">
          🎁 {quiz?.prize}
        </h2>
        <div>
          {router.query.id >= 0 ? (
            <div className="flex items-center space-x-5">
              <button
                onClick={handleCopyLink}
                className="text-[#233237] text-sm font-bold"
              >
                Share link
              </button>
              <button
                disabled={quizId.status >= 1}
                onClick={handleStartQuestion}
                className={`uppercase min-w-[155px] py-2 font-bold text-base text-white rounded-md 
                ${quizId.status >= 1 ? 'bg-[#989898]' : 'bg-[#DE411B]'} 
        `}
              >
                {quizId.status >= 1 ? 'Opened' : 'Open'}
              </button>
              <Image
                className="absolute top-2 right-3 cursor-pointer"
                src={ThreeDots}
                width={4}
                height={13}
                alt="More"
              />
            </div>
          ) : (
            <button
              onClick={handleStartAgain}
              className="uppercase min-w-[155px] py-2 font-bold text-base bg-[#233237] text-white rounded-md"
            >
              Start again
            </button>
          )}
        </div>
      </div>
      {/* <Modal quiz={quiz} isOpen={isOpen} handleStartAgain={handleStartAgain} /> */}
    </div>
  )
}

export default ListQuizComponent
