import { Features } from "@/components/landing/features";
import { Hero } from "@/components/landing/hero";

export default function Home() {
  return (
    <div className="flex min-h-screen flex-col">
      <main className="flex-grow">
        <div className="mx-auto max-w-[90rem] px-6 md:px-8">
          <Hero />
          <Features />
        </div>
      </main>
    </div>
  );
}
