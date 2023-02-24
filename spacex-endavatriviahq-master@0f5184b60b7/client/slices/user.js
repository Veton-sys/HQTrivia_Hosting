import { createSlice } from '@reduxjs/toolkit'

const initialState = {
  user: null,
}

export const user = createSlice({
  name: 'user',
  initialState,
  reducers: {
    handleUser: (state, action) => {
      state.user = action.payload
    },
  },
})

export const userState = (state) => state.user.user

export const { handleUser } = user.actions

export default user.reducer
