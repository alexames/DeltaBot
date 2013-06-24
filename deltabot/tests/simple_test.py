import unittest

# This is just a dummy test case.

class SimpleTest(unittest.TestCase):

    def test_pass(self):
        assert 1 == 1, 'Some how 1 is not equal to 1'

        self.assertTrue(1 == 1, 'Some how 1 is not equal to 1')
        self.assertEqual(1, 1, 'Some how 1 is not equal to 1')

    def test_raises(self):
        def raise_test():
            raise ValueError('this is bad')

        self.assertRaises(ValueError, raise_test)

