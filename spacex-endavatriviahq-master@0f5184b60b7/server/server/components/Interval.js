import React, { useMemo, useState } from 'react'
import dayjs from 'dayjs'

const Interval = ({ request }) => {
  const [time, setTime] = useState()
  useMemo(() => {
    var currentTime = dayjs()
    var diffTime = dayjs(request.startingDateTime).unix() - currentTime.unix()
    var duration = dayjs.duration(diffTime * 1000, 'milliseconds')
    var interval = 1000
    const twoDP = (n) => (n > 9 ? n : '0' + n)
    setInterval(() => {
      duration = dayjs.duration(
        duration.asMilliseconds() - interval,
        'milliseconds'
      )
      let timestamp = `${
        duration.days() && duration.days() + 'd '
      }${duration.hours()}h ${twoDP(duration.minutes())}m ${twoDP(
        duration.seconds()
      )}s`
      setTime(timestamp)
    }, interval)
  }, [request.startingDateTime])
  return (
    <div className="flex mt-5 text-center">
      <p className="text-[#de411b] text-8xl font-bold">{time}</p>
    </div>
  )
}

export default Interval
