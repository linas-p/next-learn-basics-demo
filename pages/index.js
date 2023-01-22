import Head from 'next/head'
import Layout, { siteTitle } from '../components/layout'
import utilStyles from '../styles/utils.module.css'

export default function Home({ }) {
  return (
    <Layout home>
      <Head>
        <title>{siteTitle}</title>
      </Head>
      <section className={utilStyles.headingMd}>
        <p>
          Hello, I’m <strong>Linas Petkevičius</strong>. I’m a deep learning researcher. You can contact me on{' '}
          <a href="https://www.linkedin.com/in/linas-petkevicius/">LinkedIn</a>.
        </p>
        <p>
          (This is a sample website - from {' '}
          <a href="https://github.com/vercel/next-learn/tree/master/basics/demo"> Next.js demos</a>.)
        </p>
      </section>
      <section className={`${utilStyles.headingMd} ${utilStyles.padding1px}`}>
      </section>
    </Layout>
  )
}
