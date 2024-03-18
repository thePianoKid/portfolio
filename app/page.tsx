"use client";
import React from "react";
import { HeroParallax } from "./components/ui/hero-parallax";

function HeroParallaxDemo() {
  return <HeroParallax products={products} />;
}
export const products = [
  {
    title: "Robotic Artist",
    link: "https://github.com/thePianoKid/steampunk-robotics-microPython",
    thumbnail:
      "https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2Ffdf9b984-61ae-4f61-9bbe-d1bb480f96b2%2F40dbb7c2-63c4-49a3-8ed6-531cd24da232%2Fev3.png?id=d0cf9111-2233-495f-a09a-1caa86c4798c&table=block&spaceId=fdf9b984-61ae-4f61-9bbe-d1bb480f96b2&width=2000&userId=c4b95cc2-6e5c-404e-89ab-6692222be8b3&cache=v2",
  },

  {
    title: "Caesar’s Cipher",
    link: "https://github.com/thePianoKid/cipher",
    thumbnail:
      "https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2Ffdf9b984-61ae-4f61-9bbe-d1bb480f96b2%2F684868c7-6884-435c-94db-a9b03e3e2f63%2Fcipher.png?table=block&id=0d8f05a8-db2e-4993-99b8-cab3a45f13cc&spaceId=fdf9b984-61ae-4f61-9bbe-d1bb480f96b2&width=2000&userId=c4b95cc2-6e5c-404e-89ab-6692222be8b3&cache=v2",
  },

  {
    title: "React.js Blog with Google Authentication",
    link: "https://steampunk-blog--development.gadget.app/",
    thumbnail:
      "https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2Ffdf9b984-61ae-4f61-9bbe-d1bb480f96b2%2F8a47d867-8da8-4f34-9920-2a0ce5405127%2FScreen_Shot_2024-03-18_at_10.43.00_AM.png?id=fb7b8e52-7ac5-4419-819b-be2fcb74a69c&table=block&spaceId=fdf9b984-61ae-4f61-9bbe-d1bb480f96b2&width=2000&userId=c4b95cc2-6e5c-404e-89ab-6692222be8b3&cache=v2",
  },

  {
    title: "Conway's Game of Life",
    link: "https://github.com/thePianoKid/Life-P5",
    thumbnail:
      "https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2Ffdf9b984-61ae-4f61-9bbe-d1bb480f96b2%2F8761ce33-7577-4ce0-89a4-1382e6cea203%2FScreen_Shot_2023-10-01_at_10.00.06_PM.png?table=block&id=40b67cfe-c70e-459e-b560-587b17d213f0&spaceId=fdf9b984-61ae-4f61-9bbe-d1bb480f96b2&width=2000&userId=c4b95cc2-6e5c-404e-89ab-6692222be8b3&cache=v2",
  },
  {
    title: "Logomotive: A Review",
    link: "https://www.linkedin.com/pulse/logomotive-review-gabe-braden-j4ejf/",
    thumbnail:
      "https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2Ffdf9b984-61ae-4f61-9bbe-d1bb480f96b2%2F7304ccc5-1ffa-46ba-baf2-98a92b0df277%2Flogo.png?id=cfe604ff-a76a-47a0-ad1d-9057762857f7&table=block&spaceId=fdf9b984-61ae-4f61-9bbe-d1bb480f96b2&width=2000&userId=c4b95cc2-6e5c-404e-89ab-6692222be8b3&cache=v2",
  },

  {
    title: "Logomotive: A Review",
    link: "https://www.linkedin.com/pulse/logomotive-review-gabe-braden-j4ejf/",
    thumbnail:
      "https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2Ffdf9b984-61ae-4f61-9bbe-d1bb480f96b2%2F7304ccc5-1ffa-46ba-baf2-98a92b0df277%2Flogo.png?id=cfe604ff-a76a-47a0-ad1d-9057762857f7&table=block&spaceId=fdf9b984-61ae-4f61-9bbe-d1bb480f96b2&width=2000&userId=c4b95cc2-6e5c-404e-89ab-6692222be8b3&cache=v2",
  },

  {
    title: "Bug Squash",
    link: "https://www.linkedin.com/posts/gabe-braden_i-had-such-a-great-time-working-on-this-project-activity-7137251233282564096-Po1u/?utm_source=share&utm_medium=member_desktop",
    thumbnail:
      "https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2Ffdf9b984-61ae-4f61-9bbe-d1bb480f96b2%2Fd88a723b-e812-4483-b63b-61d3630cda41%2FScreen_Shot_2024-03-18_at_10.46.56_AM.png?id=35d05844-5cbe-444b-86a2-053fedbb1917&table=block&spaceId=fdf9b984-61ae-4f61-9bbe-d1bb480f96b2&width=2000&userId=c4b95cc2-6e5c-404e-89ab-6692222be8b3&cache=v2",
  },
  {
    title: "Steampunk Education",
    link: "https://steampunk.education",
    thumbnail:
      "https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2Ffdf9b984-61ae-4f61-9bbe-d1bb480f96b2%2F9da2189d-48c1-437d-919a-e34b5b0ec178%2Fsteampunk4.png?id=86b73999-5436-4979-91b3-1d73704a1f16&table=block&spaceId=fdf9b984-61ae-4f61-9bbe-d1bb480f96b2&width=2000&userId=c4b95cc2-6e5c-404e-89ab-6692222be8b3&cache=v2",
  },

  {
    title: "ReTell",
    link: "https://userogue.com",
    thumbnail:
      "https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2Ffdf9b984-61ae-4f61-9bbe-d1bb480f96b2%2F28efbe42-0bac-414a-a3f1-fbc7a92a98a0%2Fretell.png?table=block&id=91e96a45-1a20-444a-8655-31f24b571802&spaceId=fdf9b984-61ae-4f61-9bbe-d1bb480f96b2&width=2000&userId=c4b95cc2-6e5c-404e-89ab-6692222be8b3&cache=v2",
  },
];

export default HeroParallaxDemo;
