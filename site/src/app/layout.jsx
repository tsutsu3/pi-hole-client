import { Footer, Layout, Navbar } from 'nextra-theme-docs'
import { Banner, Head } from 'nextra/components'
import { getPageMap } from 'nextra/page-map'
import Image from 'next/image'
import 'nextra-theme-docs/style.css'

export const metadata = {
  // Define your metadata here
  // For more information on metadata API, see: https://nextjs.org/docs/app/building-your-application/optimizing/metadata
}

const banner = <Banner storageKey="some-key">Nextra 4.0 is released 🎉</Banner>

const navbar = (
  <Navbar
    logo={
      <>
        <Image src="/pi-hole-client-icon-large-round.svg" alt="Pi-hole client logo" width={24} height={24} />
        <span style={{ marginLeft: '.4em', fontWeight: 800 }}>
          Pi-hole client
        </span>
      </>
    }
    projectLink="https://github.com/tsutsu3/pi-hole-client"
    // Includes a Google Play Store icon and link, which is used for Play Store access (not for chat)
    chatLink="https://play.google.com/store/apps/details?id=io.github.tsutsu3.pi_hole_client"
    chatIcon={<Image src="/googleplay.svg" alt="google play" width={24} height={24} />}
  />
)
const footer = <Footer>MIT {new Date().getFullYear()} © Nextra.</Footer>

export default async function RootLayout({ children }) {
  return (
    <html
      // Not required, but good for SEO
      lang="en"
      // Required to be set
      dir="ltr"
      // Suggested by `next-themes` package https://github.com/pacocoursey/next-themes#with-app
      suppressHydrationWarning
    >
      <Head
      // ... Your additional head options
      >
        {/* Your additional tags should be passed as `children` of `<Head>` element */}
      </Head>
      <body>
        <Layout
          banner={banner}
          navbar={navbar}
          pageMap={await getPageMap()}
          docsRepositoryBase="https://github.com/tsutsu3/pi-hole-client/site"
          footer={footer}
          // ... Your additional layout options
        >
          {children}
        </Layout>
      </body>
    </html>
  )
}