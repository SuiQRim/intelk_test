using BracketCorrector.Interfaces;

namespace BracketCorrector;

public class BracketValidator : IBracketValidator
{
	private const string _openBrackets = "[({";
	private const string _closeBrackets = "])}";
	public bool Validate(string text)
	{
		Stack<char> stack = new ();
		foreach (var t in text)
		{
			if (_openBrackets.Any(x => x == t))
			{
				stack.Push(t);
			}
			else if (_closeBrackets.Any(x => x == t))
			{
				if (stack.Count == 0)
				{
					return false;
				}

				if (stack.First() == GetOppositeBracket(t))
				{
					stack.Pop();
				} 		
			}
			else
			{
				continue;
			}
		}
		return stack.Count == 0;
	}

	private char GetOppositeBracket(char a)
	{
		if (_closeBrackets.Any(x => x == a))
		{
			return _openBrackets[_closeBrackets.IndexOf(a)];
		}
		else 
		{
			return _closeBrackets[_openBrackets.IndexOf(a)];
		}
	}

}
