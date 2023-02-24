import { createSlice } from '@reduxjs/toolkit'

const initialState = {
  modal: false,
}

export const triviaModalToggle = createSlice({
  name: 'triviaModal',
  initialState,
  reducers: {
    handleModalToggle: (state, action) => {
      state.modal = action.payload
    },
    // addImage: (state, action) => {
    //   state.image = action.payload
    // },
  },
})

export const modalToggle = (state) => state.modal.modal

// export const image = (state) => state.modal.image

export const { handleModalToggle } = triviaModalToggle.actions

export default triviaModalToggle.reducer
