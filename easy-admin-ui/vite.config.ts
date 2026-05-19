import {ConfigEnv, defineConfig, loadEnv, UserConfig} from 'vite'
import vue from '@vitejs/plugin-vue'
import {resolve} from 'path'
// import eslint from "vite-plugin-eslint";

export default defineConfig(({mode}: ConfigEnv): UserConfig => {
    const env = loadEnv(mode, process.cwd())
    console.log('env', env)
    const {VITE_APP_PORT, VITE_APP_BASE_URL, VITE_APP_BASE_API, VITE_PUBLIC_PATH} = env
    return {
        plugins: [vue()],
        resolve: {
            alias: {
                '@': resolve(__dirname, 'src')
            }
        },
        base: VITE_PUBLIC_PATH,
        server: {
            host: '0.0.0.0',
            port: Number(VITE_APP_PORT),
            open: true,
            hmr: true,
            strictPort: false,
            cors: true,
            proxy: {
                [VITE_APP_BASE_API]: {
                    target: VITE_APP_BASE_URL,
                    ws: true,
                    changeOrigin: true,
                    rewrite: (path: string) => path.replace(VITE_APP_BASE_API, '')
                }
            }
        },
        define: {
            __NEXT_NAME__: JSON.stringify(process.env.npm_package_name)
        }
    }
})
