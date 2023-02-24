import React, { Fragment, useState } from 'react'
import { Dialog, Transition } from '@headlessui/react'
import { useSelector } from 'react-redux'
import { getImage } from '../slices/triviaImg'

const Modal = ({ isOpen, handleIsOpen, quiz }) => {
  const img = useSelector(getImage)
  const [formTrivia, setFormTrivia] = useState({
    name: quiz.name,
    date: new Date(quiz.startingDateTime).toLocaleDateString(),
    time: new Date(quiz.startingDateTime).toLocaleTimeString(),
    prize: quiz.prize,
  })
  console.log(quiz.id)
  const handleUpdateTrivia = () => {
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
    fetch(`https://localhost:7104/admin/Quizzes/${quiz.id}`, {
      headers: {
        'Content-Type': 'application/json',
      },
      method: 'PUT',
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
        if (data) handleIsOpen()
      })
  }

  return (
    <Transition appear show={isOpen} as={Fragment}>
      <Dialog as="div" className="relative z-10" onClose={handleIsOpen}>
        <Transition.Child
          as={Fragment}
          enter="ease-out duration-300"
          enterFrom="opacity-0"
          enterTo="opacity-100"
          leave="ease-in duration-200"
          leaveFrom="opacity-100"
          leaveTo="opacity-0"
        >
          <div className="fixed inset-0 bg-black bg-opacity-25" />
        </Transition.Child>

        <div className="fixed inset-0 overflow-y-auto">
          <div className="flex min-h-full items-center justify-center p-10 text-center">
            <Transition.Child
              as={Fragment}
              enter="ease-out duration-300"
              enterFrom="opacity-0 scale-95"
              enterTo="opacity-100 scale-100"
              leave="ease-in duration-200"
              leaveFrom="opacity-100 scale-100"
              leaveTo="opacity-0 scale-95"
            >
              <Dialog.Panel className="w-full max-w-5xl transform overflow-hidden rounded-md bg-white p-6 align-middle shadow-md transition-all">
                <Dialog.Title
                  as="h3"
                  className="text-lg font-medium leading-6 text-gray-900"
                >
                  Update: {quiz.name}
                </Dialog.Title>
                <div className="w-full flex flex-col items-center bg-[#F8F8F8] space-y-10 h-80 mt-8 p-8">
                  <div className="flex w-full">
                    <input
                      className="input__primary "
                      value={formTrivia.name}
                      onChange={(e) =>
                        setFormTrivia({ ...formTrivia, name: e.target.value })
                      }
                      type="text"
                      placeholder="Quiz Name"
                    />
                  </div>
                  <div className="flex items-center w-full justify-between mt-5">
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
                  <button
                    onClick={handleUpdateTrivia}
                    className="button w-1/3 mt-4"
                  >
                    Update
                  </button>
                </div>
              </Dialog.Panel>
            </Transition.Child>
          </div>
        </div>
      </Dialog>
    </Transition>
  )
}

export default Modal
