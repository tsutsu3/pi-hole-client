"use client";

import Image from "next/image";
import { Link } from "nextra-theme-docs";
import { PLAY_STORE_URL } from "@/lib/constants";

export function Hero() {
  return (
    <section className="relative container grid lg:grid-cols-2 place-items-center py-20 md:py-32 gap-10">
      <div className="text-center lg:text-left space-y-6 md:pl-12">
        <main className="text-5xl md:text-6xl font-bold">
          <h1 className="inline">
            <span className="inline bg-gradient-to-r from-rose-500 to-blue-500 bg-clip-text text-transparent">
              Take Control
            </span>{" "}
            of Your Network
          </h1>
        </main>
        <p className="text-xl text-muted-foreground md:w-10/12 mx-auto lg:mx-0">
          The unofficial Pi-hole client for Android. Monitor and manage your
          Pi-hole instance on the go with a clean, modern interface.
        </p>
        <div className="flex flex-col z-10 items-center gap-4 lg:flex-row lg:items-start lg:space-x-4">
          <Link
            href={PLAY_STORE_URL}
            className="mx-auto lg:mx-0 inline-block lg:py-6"
          >
            <Image
              src="/get-google-play.png"
              alt="Get it on Google Play"
              width={200}
              height={80}
            />
          </Link>
        </div>
      </div>
      <div className="z-10">
        <Image
          src="/light-mock.png"
          alt="Pi-Hole client app screenshot"
          width={256}
          height={256}
          className="block dark:hidden"
        />
        <Image
          src="/dark-mock.png"
          alt="Pi-Hole client app screenshot (dark mode)"
          width={256}
          height={256}
          className="hidden dark:block"
        />
      </div>
      {/* Grids */}
      <div className="absolute inset-0  h-full w-full pointer-events-none bg-[linear-gradient(to_right,#8080800a_1px,transparent_1px),linear-gradient(to_bottom,#8080800a_1px,transparent_1px)] bg-[size:14px_24px]"></div>
    </section>
  );
}
