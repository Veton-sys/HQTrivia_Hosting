import React, { useEffect, useState } from 'react'
import Image from 'next/image'
import XIcon from '../public/images/xIcon.svg'
import AnswerComponent from './AnswerComponent'
import CirclePlusIcon from '../public/images/circleplus.svg'
import SaveImage from '../public/images/save.svg'
import { useRouter } from 'next/router'
import { useDispatch, useSelector } from 'react-redux'
import { getQuizById } from '../slices/quizById'
import { addQuestion } from '../slices/quizById'
import { handleError } from '../slices/error'

const QuestionComponent = ({ questionData, id }) => {
  const quizId = useSelector(getQuizById)
  const dispatch = useDispatch()
  const router = useRouter()
  const [question, setQuestion] = useState('')
  const [duration, setDuration] = useState(10)
  const [answers, setAnswers] = useState([])

  useEffect(() => {
    let newAnswers = JSON.parse(JSON.stringify(questionData?.answers))
    setAnswers(newAnswers)
    let newQuestion = questionData?.text
    setQuestion(newQuestion)
    let newDuration = questionData?.duration
    setDuration(newDuration)
  }, [questionData?.answers, questionData?.text, questionData?.duration])

  const handleAnswers = (event, key) => {
    const index = answers.findIndex((x) => x.id === key)
    if (index !== -1) {
      const temporaryarray = answers.slice()
      temporaryarray[index][event?.target?.name] = event?.target?.value
      if (event.target.name === 'isCorrect') {
        temporaryarray[index][event?.target?.name] = event?.target?.checked
      }
      setAnswers(temporaryarray)
    }
  }

  const handleQuestion = (value) => {
    setQuestion(value.target.value)
  }
  const handleDuration = (value) => {
    setDuration(value.target.value)
  }
  const removeObjectWithId = (arr, id) => {
    const arrCopy = Array.from(arr)
    const objWithIdIndex = arrCopy.findIndex((obj) => obj.id === id)
    arrCopy.splice(objWithIdIndex, 1)
    return arrCopy
  }

  const handleAddOrRemoveMoreAnswers = (event, id) => {
    switch (event) {
      case 'Add':
        setAnswers([
          ...answers,
          {
            id: answers[answers.length - 1].id + 1,
            text: '',
            isCorrect: false,
          },
        ])
        break
      case 'Remove':
        if (answers.length > 2) {
          setAnswers(removeObjectWithId(answers, id))
        }
        break
    }
  }

  const handleCreateQuestion = async () => {
    if (question.length <= 0) setError(true)

    if (answers.filter(({ isCorrect }) => isCorrect === true).length !== 1) {
      dispatch(handleError(true))
    } else {
      await fetch('https://localhost:7104/admin/Question', {
        headers: {
          'Content-Type': 'application/json',
          accept: 'text/plain',
        },
        method: 'POST',
        mode: 'cors',
        body: JSON.stringify({
          text: question,
          duration: duration,
          answers: answers,
          quizId: router.query.id,
        }),
      })
      dispatch(
        addQuestion({
          ...quizId,
          questions: [...quizId.questions],
        })
      )
    }
  }
  const handleDeleteQuestion = async () => {
    await fetch(`https://localhost:7104/admin/Question/${questionData.id}`, {
      rejectUnauthorized: false,
      method: 'DELETE',
    })
    window.location.reload()
  }

  return (
    <>
      <div className="w-full bg-[#F8F8F8] min-h-[290px] p-8 mx-auto pt-7">
        <div className="flex relative justify-between px-8">
          <h2 className="text-[#233237] font-bold text-lg">
            Question: {id + 1}
          </h2>
          <Image
            onClick={handleDeleteQuestion}
            alt="Cloese X icon"
            className="cursor-pointer"
            src={XIcon}
            width={12}
            height={12}
          />
        </div>
        <div className="flex flex-col px-8 pt-5">
          <input
            type="text"
            value={question}
            onChange={handleQuestion}
            name="question"
            placeholder="Type your question"
            className="input__primary mb-1"
          />
          {answers?.map(({ id, isCorrect, text }) => (
            <AnswerComponent
              key={id}
              id={id}
              checked={isCorrect}
              answer={text}
              handleAnswers={handleAnswers}
              handleAddOrRemoveMoreAnswers={handleAddOrRemoveMoreAnswers}
            />
          ))}

          <div className="flex items-center justify-between mt-5">
            <div className="flex items-center space-x-10">
              <div
                onClick={() => handleAddOrRemoveMoreAnswers('Add')}
                className="flex items-center space-x-3 cursor-pointer"
              >
                <Image
                  src={CirclePlusIcon}
                  width={24}
                  height={24}
                  className="object-contain"
                  alt="Add trivia quiz"
                />
                <h2 className="text-[#233237] font-sans font-normal text-base">
                  Add more answers
                </h2>
              </div>
              {/* <div className="flex items-center space-x-3 cursor-pointer">
                <Image
                  src={SaveImage}
                  width={18}
                  height={18}
                  className="object-contain"
                  alt="Save Update"
                />
                <h2 className="text-[#233237] font-sans font-normal text-base">
                  Save question
                </h2>
              </div> */}
            </div>
            <div className="flex items-center space-x-2">
              <h2 className='text-[#233237] font-sans font-bold text-normal"'>
                Time:
              </h2>
              <input
                type="number"
                name="duration"
                value={duration}
                onChange={handleDuration}
                placeholder="Sec"
                className="w-16 h-8 text-[#233237] font-normal text-base"
              />
              <p className="text-xs text-[#233237]">sec</p>
            </div>
          </div>
        </div>
      </div>
      <div className="pb-10">
        {quizId.questions.length - 1 === id && (
          <button onClick={handleCreateQuestion} className="button">
            add question
          </button>
        )}
      </div>
    </>
  )
}

export default QuestionComponent
