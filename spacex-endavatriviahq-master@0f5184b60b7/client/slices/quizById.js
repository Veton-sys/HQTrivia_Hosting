import { createSlice } from '@reduxjs/toolkit'
import { uuidInt } from '../utils/uuid'

const initialState = {
  quizById: {
    currencyType: '',
    id: 0,
    name: '',
    prize: 0,
    questions: [
      {
        id: uuidInt(),
        text: '',
        duration: 10,
        button: true,
        answers: [
          {
            id: uuidInt(),
            text: '',
            isCorrect: false,
          },
          {
            id: uuidInt(),
            text: '',
            isCorrect: false,
          },
          {
            id: uuidInt(),
            text: '',
            isCorrect: false,
          },
        ],
      },
    ],
    startingDateTime: '',
    status: 0,
    thumbNailURL: null,
  },
}

export const quizById = createSlice({
  name: 'quizById',
  initialState,
  reducers: {
    addquizById: (state, action) => {
      state.quizById = {
        ...action.payload,
        questions: [
          ...action.payload.questions,
          {
            id: uuidInt(),
            text: '',
            duration: 10,
            button: true,
            answers: [
              {
                id: uuidInt(),
                text: '',
                isCorrect: false,
              },
              {
                id: uuidInt(),
                text: '',
                isCorrect: false,
              },
              {
                id: uuidInt(),
                text: '',
                isCorrect: false,
              },
            ],
          },
        ],
      }
    },
    addQuestion: (state, action) => {
      state.quizById = {
        ...action.payload,
        questions: [
          ...action.payload.questions,
          {
            id: uuidInt(),
            text: '',
            duration: 10,
            button: true,
            answers: [
              {
                id: uuidInt(),
                text: '',
                isCorrect: false,
              },
              {
                id: uuidInt(),
                text: '',
                isCorrect: false,
              },
              {
                id: uuidInt(),
                text: '',
                isCorrect: false,
              },
            ],
          },
        ],
      }
    },
  },
})

export const getQuizById = (state) => state.quizById.quizById

export const { addquizById, addQuestion } = quizById.actions

export default quizById.reducer
