import React from 'react'
import Confetti from 'react-confetti'

const LeaderboardComponent = ({ leaderboard }) => {
  return (
    <div className="w-full pt-20">
      <Confetti />
      <h2 className="font-bold text-white text-5xl text-center">
        CONGRATULATIONS 🎉
      </h2>
      <div className="flex items-end space-x-4 pt-36">
        <div className="bg-[#EC6861] w-60 h-32 flex items-center justify-center">
          <span className="font-bold text-2xl items-center flex flex-col text-white">
            <p>2nd</p>
            <p>{leaderboard?.[1]?.username}</p>
          </span>
        </div>
        <div className="bg-[#379BD7] w-60 h-48 flex items-center justify-center">
          <span className="font-bold text-2xl items-center flex flex-col text-white">
            <p>1st</p>
            <p>{leaderboard?.[0]?.username}</p>
          </span>
        </div>
        <div className="bg-[#8CB55A] w-60 h-24 flex items-center justify-center">
          <span className="font-bold text-2xl items-center flex flex-col text-white">
            <p>3rd</p>
            <p>{leaderboard?.[2]?.username}</p>
          </span>
        </div>
      </div>
      <div className="bg-[#384F57]">
        <div className="flex flex-row items-center  px-16 py-6 justify-between text-white text-base font-bold border-b border-[#989898] h-16">
          <div className="flex space-x-20">
            <p>#</p>
            <p>User</p>
          </div>
          <p>Poins</p>
        </div>
        {leaderboard?.map((item, i) => (
          <div key={i} className="bg-[#384F57]">
            <div className="flex flex-row items-center  px-16 py-6 justify-between text-white text-base font-bold border-b border-[#989898] h-16">
              <div className="flex space-x-20">
                <p>{i + 1}</p>
                <p>{item.username}</p>
              </div>
              <p>{item.score}</p>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}

export default LeaderboardComponent
