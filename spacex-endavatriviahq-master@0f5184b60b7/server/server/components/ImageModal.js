import React, { Fragment, useRef, useState } from 'react'
import { Dialog, Transition } from '@headlessui/react'
import PlusCircleIcon from '../public/images/circleplus.svg'
import Image from 'next/image'
import { db, storage } from '../firebase'
import {
  collection,
  addDoc,
  serverTimestamp,
  doc,
  updateDoc,
} from 'firebase/firestore'
import { getDownloadURL, ref, uploadString } from 'firebase/storage'
import { useDispatch, useSelector } from 'react-redux'
import { handleModalToggle, modalToggle } from '../slices/triviaModal'
import { addImage } from '../slices/triviaImg'

const ImageModal = () => {
  const dispatch = useDispatch()
  const open = useSelector(modalToggle)
  const [selectedfile, setSelectedFile] = useState(null)
  const [loading, setLoading] = useState(false)
  const filePickerRef = useRef(null)

  const uploadPost = async () => {
    if (loading) return
    setLoading(true)
    const docRef = await addDoc(collection(db, 'trivia'), {
      timestamp: serverTimestamp(),
    })

    const imageRef = ref(storage, `trivia/${docRef.id}`)
    await uploadString(imageRef, selectedfile, 'data_url').then(
      async (snapshot) => {
        const downloadURL = await getDownloadURL(imageRef)
        await updateDoc(doc(db, 'trivia', docRef.id), {
          image: downloadURL,
        })
        dispatch(addImage(downloadURL))
      }
    )
    dispatch(handleModalToggle(false))
    setLoading(false)
    setSelectedFile(null)
  }

  const addImageToPost = (e) => {
    const reader = new FileReader()
    if (e.target.files[0]) {
      reader.readAsDataURL(e.target.files[0])
    }
    reader.onload = (readerEvent) => {
      setSelectedFile(readerEvent.target.result)
    }
  }

  return (
    <>
      <Transition appear show={open} as={Fragment}>
        <Dialog
          as="div"
          className="fixed z-10 inset-0 overflow-y-auto"
          onClose={() => dispatch(handleModalToggle(!open))}
        >
          <div className="flex items-end justify-center min-h-[800px] sm:min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
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

            {/* This element is to trick the browser into centering the modal contents. */}
            <span
              className="hidden sm:inline-block sm:align-middle sm:h-screen"
              aria-hidden="true"
            >
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
              <div className="inline-block align-bottom px-4 pt-5 pb-4  sm:w-full sm:p-6 sm:my-8 sm:align-middle sm:max-w-sm overflow-hidden text-left transition-all transform bg-white shadow-xl rounded-lg">
                <div>
                  {selectedfile ? (
                    <img
                      className="w-full object-contain cursor-pointer"
                      src={selectedfile}
                      onClick={() => setSelectedFile(null)}
                      alt="selectedimg"
                    />
                  ) : (
                    <div
                      onClick={() => filePickerRef.current.click()}
                      className="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-red-100 cursor-pointer"
                    >
                      <Image
                        src={PlusCircleIcon}
                        width={24}
                        height={24}
                        className="text-[#DE411B]"
                        alt="PlusSircleIcon"
                        aria-hidden="true"
                      />
                    </div>
                  )}

                  <div className="mt-5 text-center sm:mt-3">
                    <Dialog.Title
                      as="h3"
                      className="text-lg leading-6 font-medium text-gray-900"
                    >
                      Upload a thumbnail
                    </Dialog.Title>

                    <div>
                      <input
                        ref={filePickerRef}
                        type="file"
                        hidden
                        onChange={addImageToPost}
                      />
                    </div>
                  </div>
                  <div className="pt-10">
                    <button
                      disabled={!selectedfile}
                      onClick={uploadPost}
                      type="button"
                      className="inline-flex justify-center w-full rounded-md border border-transparent shadow-sm px-4 py-2 bg-[#DE411B] text-base font-medium text-white hover:bg-opacity-95 focus:outline-none sm:text-sm disabled:bg-gray-300 disabled:cursor-not-allowed hover:disabled:bg-gray-300"
                    >
                      {loading ? 'Uploading...' : 'Upload Post'}
                    </button>
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

export default ImageModal
