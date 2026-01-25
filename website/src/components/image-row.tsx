import React from "react";

export default function ImageRow({ children }) {
  return (
    <div style={{ display: "flex", gap: "12px", flexWrap: "wrap", marginBottom: "12px" }}>
      {children}
    </div>
  );
}
