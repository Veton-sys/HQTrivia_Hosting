import { createSlice } from '@reduxjs/toolkit'

const initialState = {
  error: false,
}

export const error = createSlice({
  name: 'error',
  initialState,
  reducers: {
    handleError: (state, action) => {
      state.error = action.payload
    },
  },
})

export const errorState = (state) => state.error.error

export const { handleError } = error.actions

export default error.reducer
