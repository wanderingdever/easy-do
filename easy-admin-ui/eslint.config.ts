import js from '@eslint/js'
import globals from 'globals'
import tseslint from 'typescript-eslint'
import pluginVue from 'eslint-plugin-vue'
import {defineConfig} from 'eslint/config'
import EslintConfigPrettier from 'eslint-config-prettier'
import pluginPrettierRecommended from 'eslint-plugin-prettier/recommended'

export default defineConfig([
    {
        files: ['**/*.{js,mjs,cjs,ts,mts,cts,vue}'],
        plugins: {js},
        extends: ['js/recommended', pluginPrettierRecommended]
    },
    {
        files: ['**/*.{js,mjs,cjs,ts,mts,cts,vue}'],
        languageOptions: {
            globals: {
                ...globals.browser,
                ...globals.node,
                // 添加全局类型声明
                TableType: 'readonly',
                TableOrder: 'readonly'
            }
        }
    },
    tseslint.configs.recommended,
    pluginVue.configs['flat/essential'],
    {
        files: ['**/*.vue'],
        languageOptions: {parserOptions: {parser: tseslint.parser}}
    },
    {
        rules: {
            'vue/multi-word-component-names': 'off',
            '@typescript-eslint/no-explicit-any': 'off',
            '@typescript-eslint/no-unused-vars': [1],
            // 将no-undef规则对TypeScript类型设置为警告而不是错误
            'no-undef': 'warn',
            // 关闭对未定义变量的警告
            'no-undefined': 'off',
            //不使用的变量不报错
            'no-unused-vars': 'off'
        }
    },
    EslintConfigPrettier
])
