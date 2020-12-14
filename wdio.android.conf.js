const { config } = require('./wdio.conf');

config.specs = [
    './test/**/*.spec.js'
];
config.capabilities = [
    {
        platformName: 'Android',
        browserName: 'Chrome',
        maxInstances: 1,
        deviceName: 'Samsung Galaxy S6',
        orientation: 'PORTRAIT',
        automationName: 'UiAutomator2',
        newCommandTimeout: 240,
        chromeOptions: {
            // w3c: true,
            args: ['--no-first-run', '--disable-popup-blocking' ],
        },
    },
];

exports.config = config;
