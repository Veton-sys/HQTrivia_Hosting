import { createSlice } from '@reduxjs/toolkit'

const initialState = {
  triviaImage: null,
}

export const triviaImage = createSlice({
  name: 'triviaImage',
  initialState,
  reducers: {
    addImage: (state, action) => {
      state.triviaImage = action.payload
    },
  },
})

export const getImage = (state) => state.triviaImage.triviaImage

export const { addImage } = triviaImage.actions

export default triviaImage.reducer
