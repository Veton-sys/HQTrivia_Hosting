import Image from 'next/image'
import React from 'react'
import ImageLogo from '../public/images/imglogo.svg'
import { useRouter } from 'next/router'
import dayjs from 'dayjs'

const QuizzComponent = ({ quiz }) => {
  const router = useRouter()

  return (
    <div
      onClick={() => router.push(`/admin/${quiz.id}`)}
      className="bg-white relative flex min-w-[270px] h-[320px] cursor-pointer transition duration-200 ease-in-out hover:shadow-md"
    >
      <div className="flex relative flex-col h-full w-full">
        <div className="relative w-full h-[172px] border-none">
          <Image
            fill
            src={quiz.thumbNailURL || ImageLogo}
            className="object-contain border-none"
            alt={quiz.name}
          />
          <div className="absolute bottom-2 right-2 py-1 px-4 flex items-center justify-center text-center rounded-md bg-[#989898] z-10">
            <p className="text-xs font-bold text-white">
              {quiz?.questions?.length} questions
            </p>
          </div>
        </div>
        <div className="flex flex-col text-start mx-4">
          <h2 className="text-[#233237] font-sans font-semibold text-lg">
            {quiz.name}
          </h2>
          <div className="flex items-center justify-between pt-2">
            <div className="flex items-center space-x-2">
              <p className="paragraph">
                {dayjs(quiz.startingDateTime).format('DD/MM/YYYY')}
              </p>
              <p className="paragraph">
                {dayjs(quiz.startingDateTime).format('HH:mm')}
              </p>
            </div>
            <p className="paragraph font-bold">{quiz.prize}</p>
          </div>
          <div className="pt-10 flex items-center justify-between">
            <button className="w-[105px] h-8 bg-[#de411b] rounded-[5px] text-white uppercase font-semibold text-base">
              Start
            </button>
            <button className="text-[#233237] text-sm font-bold">
              Share link
            </button>
          </div>
        </div>
      </div>
    </div>
  )
}

export default QuizzComponent
