import { configureStore } from '@reduxjs/toolkit'
import adminLeaderboard from '../slices/adminLeaderboard'
import currentQuizzes from '../slices/currentQuizzes'
import error from '../slices/error'
import leaderboard from '../slices/leaderboard'
import nextQuizzes from '../slices/nextQuizzes'
import pastQuizzes from '../slices/pastQuizzes'
import playersLeaderboard from '../slices/playersLeaderboard'
import playQuiz from '../slices/playIdSlice'
import quizById from '../slices/quizById'
import triviaImage from '../slices/triviaImg'
import triviaModalToggle from '../slices/triviaModal'
import user from '../slices/user'

export const store = configureStore({
  reducer: {
    modal: triviaModalToggle,
    currentQuizzes: currentQuizzes,
    pastQuizzes: pastQuizzes,
    quizById: quizById,
    leaderboard: leaderboard,
    error: error,
    triviaImage: triviaImage,
    user: user,
    playQuiz: playQuiz,
    nextQuizzes: nextQuizzes,
    playersLeaderboard: playersLeaderboard,
    adminLiderboard: adminLeaderboard,
  },
})
