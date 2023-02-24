import { createSlice } from '@reduxjs/toolkit'

const initialState = {
  playersLeaderboard: '',
}

export const playersLeaderboard = createSlice({
  name: 'playersLeaderboard',
  initialState,
  reducers: {
    addPlayersLeaderboard: (state, action) => {
      state.playersLeaderboard = action.payload
    },
  },
})

export const getLeaderboard = (state) =>
  state.playersLeaderboard.playersLeaderboard

export const { addPlayersLeaderboard } = playersLeaderboard.actions

export default playersLeaderboard.reducer
