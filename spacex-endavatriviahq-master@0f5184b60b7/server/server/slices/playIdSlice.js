import { createSlice } from '@reduxjs/toolkit'

const initialState = {
  playQuiz: null,
}

export const playQuiz = createSlice({
  name: 'playQuiz',
  initialState,
  reducers: {
    handlePlayQuiz: (state, action) => {
      state.playQuiz = action.payload
    },
  },
})

export const playQuizState = (state) => state.playQuiz.playQuiz

export const { handlePlayQuiz } = playQuiz.actions

export default playQuiz.reducer
