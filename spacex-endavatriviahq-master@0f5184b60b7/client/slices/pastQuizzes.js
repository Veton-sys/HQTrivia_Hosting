import { createSlice } from '@reduxjs/toolkit'

const initialState = {
  pastQuizzes: [],
}

export const pastQuizzes = createSlice({
  name: 'pastQuizzes',
  initialState,
  reducers: {
    addPastQuizzes: (state, action) => {
      state.pastQuizzes = action.payload
    },
  },
})

export const getAllPastQuizzes = (state) => state.pastQuizzes.pastQuizzes

export const { addPastQuizzes } = pastQuizzes.actions

export default pastQuizzes.reducer
