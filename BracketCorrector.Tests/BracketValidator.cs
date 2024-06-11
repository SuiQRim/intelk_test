namespace BracketCorrector.Tests;

public class Tests
{
	[Test]
	[TestCase("[({})]", true)]
	[TestCase("[ (   {text})text   ]", true)]
	[TestCase("[ ] ({}) ) [])", false)]
	[TestCase("[ { ( } ) ]", false)]
	[TestCase("", true)]
	[TestCase("[[[", false)]
	[TestCase("]]]", false)]
	public void ValidateBrackets(string text, bool expected)
	{
		//arrange
		BracketValidator bracketValidator = new ();

		//act
		bool isValid = bracketValidator.Validate(text);

		//assert
		Assert.That(isValid, Is.EqualTo(expected));

	}
}