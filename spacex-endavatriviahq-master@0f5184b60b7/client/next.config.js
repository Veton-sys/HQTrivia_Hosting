/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  experimental: {
    appDir: true,
  },
  images: {
    domains: [
      'www.endava.com',
      'privateequity.endava.com',
      'lh3.googleusercontent.com',
      's3-symbol-logo.tradingview.com',
      'upload.wikimedia.org',
      'firebasestorage.googleapis.com',
      'www.travelandleisure.com',
    ],
  },
}

module.exports = nextConfig
