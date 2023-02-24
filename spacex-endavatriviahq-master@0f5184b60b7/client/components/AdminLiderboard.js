import React from 'react'
import { useSelector } from 'react-redux'
import { getAdminLeaderboard } from '../slices/adminLeaderboard'

const AdminLiderboard = ({ results }) => {
  const leaderboardUsers = useSelector(getAdminLeaderboard)
  console.log('here', leaderboardUsers)
  return (
    <div className="w-full">
      <div className="bg-white">
        <div className="flex flex-row items-center  px-16 py-6 justify-between text-[#989898] text-base font-bold border-b border-[#989898] h-16">
          <div className="flex space-x-20">
            <p>#</p>
            <p>User</p>
          </div>
          <p>Poins</p>
        </div>
        {results?.map((item, i) => (
          <div key={i} className="bg-[white]">
            <div className="flex flex-row items-center px-16 py-6 justify-between text-[#233237] text-base font-bold border-b border-[#989898] h-16">
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

export default AdminLiderboard
