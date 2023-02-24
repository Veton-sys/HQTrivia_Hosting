import { createSlice } from '@reduxjs/toolkit'

const initialState = {
  adminLiderboard: [],
}

export const adminLiderboard = createSlice({
  name: 'adminLiderboard',
  initialState,
  reducers: {
    addAdminLiderboard: (state, action) => {
      state.adminLiderboard = action.payload
    },
  },
})

export const getAdminLeaderboard = (state) =>
  state.adminLiderboard.adminLiderboard

export const { addAdminLiderboard } = adminLiderboard.actions

export default adminLiderboard.reducer
