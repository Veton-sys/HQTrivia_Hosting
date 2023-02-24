import { createSlice } from '@reduxjs/toolkit'

const initialState = {
  leaderboard: [],
}

export const leaderboard = createSlice({
  name: 'leaderboard',
  initialState,
  reducers: {
    addLeaderboard: (state, action) => {
      state.leaderboard = action.payload
    },
  },
})

export const getAllUsers = (state) => state.leaderboard.leaderboard

export const { addLeaderboard } = leaderboard.actions

export default leaderboard.reducer
