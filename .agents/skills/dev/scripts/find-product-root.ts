import fs from "node:fs";
import path from "node:path";

/** Fitness360 product repo root (package name `fitness360`). */
export function findProductRoot(start = process.cwd()): string {
  let dir = path.resolve(start);
  for (let i = 0; i < 10; i++) {
    const pkgPath = path.join(dir, "package.json");
    if (fs.existsSync(pkgPath)) {
      try {
        const pkg = JSON.parse(fs.readFileSync(pkgPath, "utf8")) as { name?: string };
        if (pkg.name === "fitness360") return dir;
      } catch {
        /* continue */
      }
    }
    const parent = path.dirname(dir);
    if (parent === dir) break;
    dir = parent;
  }
  throw new Error(
    "Fitness360 product repo not found. Clone gymkhana and run commands from that directory."
  );
}

if (process.argv[1]?.includes("find-product-root")) {
  console.log(findProductRoot());
}
