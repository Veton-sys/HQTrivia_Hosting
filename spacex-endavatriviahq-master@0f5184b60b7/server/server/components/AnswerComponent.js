import React from 'react'
import Image from 'next/image'
import { CheckIcon } from '@heroicons/react/24/solid'
import XIcon from '../public/images/xIcon.svg'

const AnswerComponent = ({
  id,
  handleAnswers,
  answer,
  checked,
  handleAddOrRemoveMoreAnswers,
}) => {
  return (
    <div className="flex items-center space-x-3 justify-center mt-2">
      <div className="flex relative flex-grow items-center bg-white">
        <input
          type="text"
          key={id}
          value={answer}
          name="text"
          onChange={(event) => handleAnswers(event, id)}
          placeholder={`Answer`}
          className="input__primary"
          required
        />
        <label className="cursor-pointer relative flex items-center justify-center">
          <input
            type="checkbox"
            key={id}
            value={checked}
            onClick={(event) => handleAnswers(event, id)}
            name="isCorrect"
            className={`appearance-none w-9 h-9 bg-white border border-[#8CB55A] rounded transition ease-out duration-300 ${
              checked && 'bg-[#8cb55a]'
            }`}
          />
          <CheckIcon
            color={checked ? 'white' : '#8cb55a'}
            className={`absolute w-7 h-8 rotate-12 flex transition ease-out duration-300`}
          />
        </label>
        <Image
          onClick={() => handleAddOrRemoveMoreAnswers('Remove', id)}
          width={14}
          height={11}
          src={XIcon}
          className={`mx-4 cursor-pointer`}
          alt="XIcon"
        />
      </div>
    </div>
  )
}

export default AnswerComponent
