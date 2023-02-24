import { createSlice } from '@reduxjs/toolkit'

const initialState = {
  currentQuizzes: [],
}

export const currentQuizzes = createSlice({
  name: 'currentQuizzes',
  initialState,
  reducers: {
    addCurrentQuizzes: (state, action) => {
      state.currentQuizzes = action.payload
    },
  },
})

export const getAllCurrentQuizzes = (state) =>
  state.currentQuizzes.currentQuizzes

export const { addCurrentQuizzes } = currentQuizzes.actions

export default currentQuizzes.reducer
