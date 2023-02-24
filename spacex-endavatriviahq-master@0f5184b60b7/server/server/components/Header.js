import React from 'react'
import Image from 'next/image'
import EndavaLogo from '../public/images/endava-logo.svg'
import Avatar from '../public/images/avatar.svg'
import { useRouter } from 'next/router'

const Header = () => {
  const router = useRouter()

  return (
    <header
      className={`sticky top-0 h-20 z-10 w-full ${
        router?.pathname.includes('/admin')
          ? 'z-50 bg-[#233237]'
          : 'bg-transparent z-50'
      }`}
    >
      <div
        className={`flex relative justify-between pt-4 max-w-7xl mx-2 md:mx-auto items-center
        ${!router.pathname.includes('/admin') && 'justify-center'}
        `}
      >
        <div className="relative w-44 h-10">
          <Image
            priority={true}
            className={`object-contain`}
            src={EndavaLogo}
            alt="Endava Logo"
            sizes="(max-width: 200px), (max-height: 60px)"
            fill
          />
        </div>
        {
          router.pathname.includes('/admin') && (
            <div
              onClick={() => router.push('/admin')}
              className="flex items-center space-x-2 cursor-pointer"
            >
              <Image
                priority={true}
                className={`object-contain`}
                src={Avatar}
                alt="Avatar"
                width={49}
                height={49}
              />
              <h2 className="font-bold text-white font-sans text-base hidden md:inline">
                Administrator
              </h2>
            </div>
          )
          // : (
          //   play.status >= 1 && (
          //     <h2 className="font-bold text-white text-end font-sans text-base hidden md:inline mr-4">
          //       {user}
          //     </h2>
          //   )
          // )
        }
      </div>
    </header>
  )
}

export default Header
