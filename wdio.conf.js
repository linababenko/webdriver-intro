exports.config = {
    // ====================
    // Runner and framework Configuration
    // ====================
    runner: 'local',
    framework: 'mocha',
    jasmineNodeOpts: {
        defaultTimeoutInterval: 90000,
    },
    sync: true,
    logLevel: 'silent',
    logLevels: {
        webdriver: 'silent',
        '@wdio/applitools-service': 'silent',
    },
    deprecationWarnings: true,
    bail: 0,
    baseUrl: 'https://appiumpro.com',
    waitforTimeout: 100000,
    connectionRetryTimeout: 90000,
    // connectionRetryCount: 0,
    reporters: ['spec'],

    // ====================
    // Appium Configuration
    // ====================
    services: [
        [
            'appium',
            {
                // https://github.com/webdriverio/webdriverio/tree/master/packages/wdio-appium-service
                args: {
                    allowInsecure: 'chromedriver_autodownload',
                },
                // https://github.com/webdriverio/webdriverio/tree/master/packages/wdio-appium-service
                command: 'appium',
            },
        ],
    ],
    port: 4723,

    // ====================
    // Some hooks
    // ====================
    beforeSession: (config, capabilities, specs) => {
        require('@babel/register');
    },
};
