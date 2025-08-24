import { Hero } from "@/components/landing/hero";
import { Features } from "@/components/landing/features";

export default function Home() {
  return (
    <div className="flex flex-col min-h-screen">
      <main className="flex-grow">
        <div className="mx-auto max-w-[90rem] px-6 md:px-8">
          <Hero />
          <Features />
        </div>
      </main>
    </div>
  );
}
