import React from 'react'
import CirclePlusIcon from '../public/images/circleplus.svg'
import Image from 'next/image'
import { useRouter } from 'next/router'

const AddQuizComponent = () => {
  const router = useRouter()

  return (
    <div
      onClick={() => router.push('/admin/create-quiz')}
      className="bg-white relative flex min-w-[270px] h-[320px] cursor-pointer transition duration-200 ease-in-out hover:shadow-md"
    >
      <div className="flex flex-col w-full h-full space-y-3 items-center justify-center">
        <Image
          src={CirclePlusIcon}
          width={40}
          height={40}
          className="object-contain"
          alt="Add trivia quiz"
        />
        <h2 className="text-[#233237] font-sans font-semibold text-lg">
          Add new quiz
        </h2>
      </div>
    </div>
  )
}

export default AddQuizComponent
