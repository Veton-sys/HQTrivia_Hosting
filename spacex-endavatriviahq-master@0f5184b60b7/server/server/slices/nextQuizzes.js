import { createSlice } from '@reduxjs/toolkit'

const initialState = {
  nextQuizzes: [],
}

export const nextQuizzes = createSlice({
  name: 'nextQuizzes',
  initialState,
  reducers: {
    addNextQuizzes: (state, action) => {
      state.nextQuizzes = action.payload
    },
  },
})

export const getAllNextQuizzes = (state) => state.nextQuizzes.nextQuizzes

export const { addNextQuizzes } = nextQuizzes.actions

export default nextQuizzes.reducer
