import Image from 'next/image'
import React, { useState } from 'react'
import PlusCircleIcon from '../public/images/circleplus.svg'
import CheckCircleIcon from '../public/images/check-circle.svg'
import { useRouter } from 'next/router'
import { useDispatch, useSelector } from 'react-redux'
import { handleModalToggle, modalToggle } from '../slices/triviaModal'
import { getImage } from '../slices/triviaImg'
import { handleError } from '../slices/error'

const CreateQuizComponent = () => {
  const router = useRouter()
  const dispatch = useDispatch()
  const modal = useSelector(modalToggle)
  const img = useSelector(getImage)

  const [formTrivia, setFormTrivia] = useState({
    name: '',
    date: '',
    time: '',
    prize: '',
  })

  const handleCreateQuiz = async () => {
    if (
      !formTrivia.name ||
      !formTrivia.prize ||
      !formTrivia.date ||
      !formTrivia.time
    ) {
      dispatch(handleError(true))
    }

    let apptDate = new Date(formTrivia.date)
    let timeSplit = formTrivia.time.split(':')
    apptDate.setUTCHours(timeSplit[0])
    apptDate.setUTCMinutes(timeSplit[1])
    fetch('https://localhost:7104/admin/Quizzes/CreateQuiz', {
      headers: {
        'Content-Type': 'application/json',
      },
      method: 'POST',
      mode: 'cors',
      body: JSON.stringify({
        name: formTrivia.name,
        startingDateTime: apptDate.toISOString(),
        prize: formTrivia.prize,
        ThumbNailURL: img,
        currencyType: 'USD',
        status: '0',
      }),
    })
      .then((response) => {
        return response.json()
      })
      .then((data) => {
        if (data) router.push('/admin')
      })
  }

  const handleModal = () => {
    dispatch(handleModalToggle(!modal))
  }

  return (
    <main className="flex flex-col justify-between max-w-7xl mx-auto items-center pt-10">
      <div className="flex flex-col md:flex-row space-y-5 md:space-y-0 w-[90%] md:w-full mx-auto items-center justify-between">
        <h2 className="font-sans font-bold text-[#233237] text-2xl md:text-4xl">
          Create new quiz
        </h2>
      </div>
      <div className="w-full flex flex-col bg-[#F8F8F8] h-80 mt-8 p-8">
        <div className="flex">
          <input
            className="input__primary"
            value={formTrivia.name}
            onChange={(e) =>
              setFormTrivia({ ...formTrivia, name: e.target.value })
            }
            type="text"
            placeholder="Quiz Name"
          />
        </div>
        <div className="flex items-center space-x-3 justify-between mt-5">
          <input
            className="input__primary flex-grow-0 w-[32%]"
            value={formTrivia.date}
            onChange={(e) =>
              setFormTrivia({ ...formTrivia, date: e.target.value })
            }
            type="date"
            placeholder="Date"
          />
          <input
            className="input__primary flex-grow-0 w-[32%]"
            value={formTrivia.time}
            onChange={(e) =>
              setFormTrivia({ ...formTrivia, time: e.target.value })
            }
            type="time"
            placeholder="Time"
          />
          <input
            className="input__primary flex-grow-0 w-[32%]"
            value={formTrivia.prize}
            onChange={(e) =>
              setFormTrivia({ ...formTrivia, prize: e.target.value })
            }
            type="text"
            placeholder="Prize"
          />
        </div>
        <div
          onClick={handleModal}
          className="flex mt-6 items-center space-x-2 cursor-pointer"
        >
          <Image
            alt="PlusCircleIcon"
            src={img ? CheckCircleIcon : PlusCircleIcon}
            width={24}
            height={24}
          />
          <p className="text-base text-[#233237] font-normal">
            {img ? 'Uploaded' : 'Upload thumbnail'}
          </p>
        </div>
        <div className="flex mt-5 items-center justify-center">
          <button
            disabled={
              !formTrivia.name ||
              !formTrivia.date ||
              !formTrivia.time ||
              !formTrivia.prize
            }
            onClick={handleCreateQuiz}
            type="button"
            className="button"
          >
            Create quiz
          </button>
        </div>
      </div>
    </main>
  )
}

export default CreateQuizComponent
