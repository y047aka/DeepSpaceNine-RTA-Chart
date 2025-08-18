import { test, expect } from '@playwright/test';

test.describe('Main Page Visual Tests', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
    await page.waitForLoadState('networkidle');
    await page.waitForTimeout(2000);
  });

  test('should render the main page correctly', async ({ page }) => {
    const mainPage = page.locator('.container').first();

    if (await mainPage.count() > 0) {
      await expect(page).toHaveScreenshot('main-page.png', {
        fullPage: true,
      });
    }
  });
});
