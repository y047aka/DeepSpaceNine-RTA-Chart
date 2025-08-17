import { test, expect } from '@playwright/test';

test.describe('Main Page Visual Tests', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
    await page.waitForLoadState('networkidle');
    await page.waitForTimeout(1000);
  });

  test('should render the main page correctly', async ({ page }) => {
    // Take a full page screenshot
    await expect(page).toHaveScreenshot('main-page.png', {
      fullPage: true,
    });
  });
});
