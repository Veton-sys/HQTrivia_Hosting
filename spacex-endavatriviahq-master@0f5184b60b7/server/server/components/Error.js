import React, { Fragment, useState } from 'react'
import { Dialog, Transition } from '@headlessui/react'
import ErrorImage from '../public/images/error.svg'
import Image from 'next/image'
import { useDispatch, useSelector } from 'react-redux'
import { errorState, handleError } from '../slices/error'

const Error = () => {
  const handleClose = () => {
    dispatch(handleError(!isError))
  }
  const isError = useSelector(errorState)
  const dispatch = useDispatch()
  return (
    <>
      <Transition appear show={isError} as={Fragment}>
        <Dialog
          as="div"
          className="fixed z-50 inset-0 overflow-y-auto flex items-center justify-center pt-96 shadow-2xl"
          onClose={handleClose}
        >
          <div className="flex items-center justify-center min-h-[800px] sm:min-h-screen p-4 text-center sm:block sm:p-0">
            <Transition.Child
              as={Fragment}
              enter="ease-out duration-300"
              enterFrom="opacity-0"
              enterTo="opacity-100"
              leave="ease-in duration-200"
              leaveFrom="opacity-100"
              leaveTo="opacity-0"
            >
              <Dialog.Overlay className="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" />
            </Transition.Child>
            <span className="inline-block " aria-hidden="true">
              &#8203;
            </span>
            <Transition.Child
              as={Fragment}
              enter="ease-out duration-300"
              enterFrom="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
              enterTo="opacity-100 translate-y-0 sm:scale-100"
              leave="ease-in duration-200"
              leaveFrom="opacity-100 translate-y-0 sm:scale-100"
              leaveTo="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
            >
              <div className="inline-block align-bottom px-6 pt-5 pb-4 sm:w-full sm:p-6 sm:my-8 sm:align-middle sm:max-w-sm overflow-hidden text-left transition-all transform bg-white shadow-xl rounded-lg">
                <div className="flex flex-col items-center">
                  <Image src={ErrorImage} width={50} height={50} alt="err" />
                  <div className="mt-3 text-center sm:mt-3">
                    <Dialog.Title
                      as="h3"
                      className="text-lg text-center leading-6 font-medium text-gray-900 p-4"
                    >
                      Oops something went wrong
                    </Dialog.Title>
                  </div>
                  <div className="pt-2">
                    <Dialog.Title
                      as="h3"
                      className="text-md text-center leading-6 font-medium text-gray-900"
                    >
                      It’s us, or maybe you forgot some field empty!
                    </Dialog.Title>
                  </div>
                </div>
              </div>
            </Transition.Child>
          </div>
        </Dialog>
      </Transition>
    </>
  )
}

export default Error
