module.exports = {
  extends: ["next/core-web-vitals"],
  // In a monorepo, next/core-web-vitals rules can't infer the app's root
  // directory from cwd alone and crash resolving internal paths. Pointing
  // them at this app explicitly fixes it. See:
  // https://nextjs.org/docs/pages/api-reference/config/eslint#rootdir
  settings: {
    next: {
      rootDir: __dirname
    }
  }
};