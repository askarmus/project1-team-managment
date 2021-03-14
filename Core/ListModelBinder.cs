using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web.Mvc;

namespace UDTID.Models
{
    public class ListModelBinder<T> : IModelBinder
    {
        public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var form = controllerContext.HttpContext.Request.Form;

            List<T> result = new List<T>();

            Regex re = new Regex(string.Format(@"^{0}\[(\d+)]\.*", bindingContext.ModelName), RegexOptions.IgnoreCase | RegexOptions.Compiled);

            var candidates = form.AllKeys.Where(x => re.IsMatch(x));
            var indices = candidates.Select(x => int.Parse(re.Match(x).Groups[1].Value)).Distinct();

            var PropInfo = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly);

            foreach (int i in indices)
            {
                T s = Activator.CreateInstance<T>();
                foreach (var prop in PropInfo)
                {
                    var value = form[string.Format("{0}[{1}].{2}", bindingContext.ModelName, i, prop.Name)];
                    s.GetType().GetProperty(prop.Name).SetValue(s, value, null);
                }
                result.Add(s);
            }

            return result;
        }
    }
}