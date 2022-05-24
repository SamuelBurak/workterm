const Path = require('path');
const webpack = require('webpack');
const moduleCSS = require('./webpack-config/css/modules');
const pluginCSS = require('./webpack-config/css/plugins');

const rootDir = Path.resolve();

const config = [
    {
        mode: 'development',
        name: 'css',
        entry: {
            'editor': rootDir + '/scss/editor.scss',
            'form': rootDir + '/scss/form.scss',
            'layout': rootDir + '/scss/layout.scss',
            'menu': rootDir + '/scss/menu.scss',
            'responsive': rootDir + '/scss/responsive.scss',
            'typography': rootDir + '/scss/typography.scss'
        },
        output: {
            path: rootDir,
            devtoolModuleFilenameTemplate: '../[resource-path]?[hash]',
            devtoolFallbackModuleFilenameTemplate: '../[resource-path]?[hash]',
            pathinfo: false,
        },
        devtool: 'nosources-source-map',
        module: moduleCSS(rootDir),
        plugins: [
            ...pluginCSS(),
        ],
        optimization: {
            splitChunks: {
                cacheGroups: {
                    default: false,
                    styles: {
                        name(module, chunks, cacheGroupKey) {
                            const moduleFileName = module.identifier().split('/').pop();
                            return moduleFileName;
                        },
                        test: /\.css$/,
                        chunks: 'all',
                        enforce: true,
                    },
                },
            },
        },
    },
];

// Use WEBPACK_CHILD=js or WEBPACK_CHILD=css env var to run a single config
module.exports = (process.env.WEBPACK_CHILD ? config.find((entry) => entry.name === process.env.WEBPACK_CHILD) : module.exports = config);