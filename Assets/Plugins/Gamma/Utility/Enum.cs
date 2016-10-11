using UnityEngine;
using System;
using System.Collections.Generic;

public static class Enum<T>
{
#region cover System.Enum Base functions

	public static bool Equals(T objA, T objB)
	{
		return System.Enum.Equals(objA, objB);
	}

	public static string Format(T value, string format)
	{
		return System.Enum.Format(typeof(T), value, format);
	}

	public static string Format(object value, string format)
	{
		return System.Enum.Format(typeof(T), value, format);
	}
	
	public static string GetName(T value)
	{
		return Enum.GetName(typeof(T), value);
	}

	public static string[] GetNames()
	{
		return Enum.GetNames(typeof(T));
	}

	public static T[] GetValues()
	{
		return (T[])Enum.GetValues(typeof(T));
	}

	public static bool IsDefined(T value)
	{
		return IsDefined(value);
	}

	public static bool IsDefined(object value)
	{
		return Enum.IsDefined(typeof(T), value);
	}

	public static T Parse(string value)
	{
		return (T)System.Enum.Parse(typeof(T), value);
	}

	public static T Parse(string value, bool ignoreCase)
	{
		return (T)System.Enum.Parse(typeof(T), value, ignoreCase);
	}

	public static bool ReferenceEquals(T objA, T objB)
	{
		return System.Enum.ReferenceEquals(objA, objB);
	}

	public static Type GetUnderlyingType(T obj)
	{
		return System.Enum.GetUnderlyingType(obj.GetType());
	}

	public static object ToObject(ushort value)
	{
		return System.Enum.ToObject(typeof(T),value);
	}
	public static object ToObject(sbyte value)
	{
		return System.Enum.ToObject(typeof(T),value);
	}
	public static object ToObject(ulong value)
	{
		return System.Enum.ToObject(typeof(T),value);
	}
	public static object ToObject(uint value)
	{
		return System.Enum.ToObject(typeof(T),value);
	}
	public static object ToObject(object value)
	{
		return System.Enum.ToObject(typeof(T),value);
	}
	public static object ToObject(short value)
	{
		return System.Enum.ToObject(typeof(T),value);
	}
	public static object ToObject(byte value)
	{
		return System.Enum.ToObject(typeof(T),value);
	}
	public static object ToObject(long value)
	{
		return System.Enum.ToObject(typeof(T),value);
	}
	public static object ToObject(int value)
	{
		return System.Enum.ToObject(typeof(T),value);
	}
#endregion
}

public static class EnumExtension {

	public static bool HasFlag(this System.Enum value, System.Enum flag)
	{
		if(!value.GetType().IsDefined(typeof(FlagsAttribute), true)){
			throw new System.ArgumentException("No Flags Attribute set for Enum, HasFlag is only possible on Enums with Flags");
		}

		if(Enum.GetUnderlyingType(value.GetType()) == typeof(ulong)){
			ulong v = Convert.ToUInt64(value);
			ulong f = Convert.ToUInt64(flag);
			if((v & f) == f)
				return true;
			return false;
		}
		if(Enum.GetUnderlyingType(value.GetType()) == typeof(long)){
			long v = Convert.ToInt64(value);
			long f = Convert.ToInt64(flag);
			if((v & f) == f)
				return true;
			return false;
		}
		if(Enum.GetUnderlyingType(value.GetType()) == typeof(uint)){
			uint v = Convert.ToUInt32(value);
			uint f = Convert.ToUInt32(flag);
			if((v & f) == f)
				return true;
			return false;
		}
		if(Enum.GetUnderlyingType(value.GetType()) == typeof(int)){
			int v = Convert.ToInt32(value);
			int f = Convert.ToInt32(flag);
			if((v & f) == f)
				return true;
			return false;
		}
		if(Enum.GetUnderlyingType(value.GetType()) == typeof(ushort)){
			ushort v = Convert.ToUInt16(value);
			ushort f = Convert.ToUInt16(flag);
			if((v & f) == f)
				return true;
			return false;
		}
		if(Enum.GetUnderlyingType(value.GetType()) == typeof(short)){
			short v = Convert.ToInt16(value);
			short f = Convert.ToInt16(flag);
			if((v & f) == f)
				return true;
			return false;
		}
		return false;
	}
}
