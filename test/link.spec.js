let page = {
    url: 'https://appiumpro.com',
    title: 'Appium Pro',
};

describe('appiumpro.com page', () => {
    it('should have the right title', async () => {
        await browser.url('/');
        await expect(browser).toHaveTitle(page.title);
    });
});



