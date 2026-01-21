import * as esbuild from 'esbuild'
import { sassPlugin } from 'esbuild-sass-plugin'

try {
    const context = await esbuild.context({
        entryPoints: [
            'FrontEnd/main.js',
            'FrontEnd/main.scss',
        ],
        outdir: 'Public',
        bundle: true,
        sourcemap: true,
        minify: true,
        plugins: [sassPlugin()],
        external: ['/images/*'],
        platform: 'browser',
    })

    if (process.argv.includes('--watch')) {
        // Watch forever!
        await context.watch()
        await new Promise(() => {})
    } else {
        await context.rebuild()
        await context.dispose()
    }
} catch {
    process.exit(1)
}
