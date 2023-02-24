import React from 'react'
import dayjs from 'dayjs'
import Interval from './Interval'
import { useSelector } from 'react-redux'
import { playQuizState } from '../slices/playIdSlice'
import { getAllNextQuizzes } from '../slices/nextQuizzes'

const PlayTime = ({ quizStatus }) => {
  const request = useSelector(playQuizState)
  const nextQuizzes = useSelector(getAllNextQuizzes)

  return (
    <div className="flex flex-col items-center justify-center mt-36">
      {quizStatus === 1 && (
        <>
          <h2 className="font-bold text-4xl text-center text-white">
            Starting in
          </h2>
          <Interval request={request} />
          <div className="flex space-x-14 max-w-7xl overflow-x-scroll scrollbar-hide mt-40">
            {nextQuizzes.map((item) => (
              <div
                className="p-4 border min-w-[240px] border-white"
                key={item.id}
              >
                <h2 className="text-white font-bold text-lg">{item.name}</h2>
                <div className="flex justify-between items-center">
                  <div className="flex items-center space-x-8">
                    <h4 className="text-xs font-normal text-white">
                      {dayjs(item.startingDateTime).format('DD/MM/YYYY')}
                    </h4>
                    <h4 className="text-xs font-normal text-white">
                      {dayjs(item.startingDateTime).format('h:MM A')}
                    </h4>
                  </div>
                  <h4 className="text-white font-bold text-xs">{item.prize}</h4>
                </div>
              </div>
            ))}
          </div>
        </>
      )}
    </div>
  )
}
export default PlayTime
